import 'package:logger/logger.dart';
import 'package:mi_reclamo/features/data/data_sources/api_seba/IcsoService.dart';
import 'package:mi_reclamo/features/domain/entities/ticket_entity.dart';

class IcsoController {
  final Logger _logger = Logger();
  final IcsoService _icsoService = IcsoService();

  /// Obtiene todos los tickets de una categoría
  Future<void> fetchAllTokenByCategory(Map<String, dynamic> headers) async {
    try {
      List<dynamic> response = await _icsoService.getAllTokenByCategory(headers);
      _logger.i('AllTokenByCategory Response: $response');
    } catch (error) {
      _logger.e('Error fetching all token by category: $error');
    }
  }

  /// Crea un nuevo ticket
  Future<void> fetchCreateTicket(Map<String, dynamic> headers, Map<String, dynamic> requestBody) async {
    try {
      Map<String, dynamic> response = await _icsoService.createTicket(headers, requestBody);
      _logger.i('CreateTicket Response: $response');
    } catch (error) {
      _logger.e('Error fetching create ticket: $error');
    }
  }

  /// Obtiene un ticket por token
  Future<Map<String, dynamic>> fetchTicketByToken(String headers) async {
    try {
      Map<String, dynamic> response = await _icsoService.getTicketByToken(headers);
      return response;
      // _logger.i('TicketByToken Response: $response');
    } catch (error) {
      _logger.e('Error fetching ticket by token: $error');
      rethrow;
    }
  }

  /// Actualiza un ticket por token
  Future<void> fetchUpdateTicketByToken(Map<String, dynamic> headers, Map<String, dynamic> requestBody) async {
    try {
      Map<String, dynamic> response = await _icsoService.updateTicket(headers, requestBody);
      _logger.i('UpdateTicketByToken Response: $response');
    } catch (error) {
      _logger.e('Error fetching update ticket by token: $error');
    }
  }

  /// Elimina un ticket por token
  Future<void> fetchDeleteTicketByToken(Map<String, dynamic> headers) async {
    try {
      Map<String, dynamic> response = await _icsoService.deleteTicket(headers);
      _logger.i('DeleteTicketByToken Response: $response');
    } catch (error) {
      _logger.e('Error fetching delete ticket by token: $error');
    }
  }

  Future<List<Ticket>> fetchAll() async {
    try {
      List<Ticket> response = await _icsoService.getAllTickets();
      _logger.i('Reclamos Response: $response');
      return response;
    } catch (error) {
      _logger.e('Error fetching reclamos: $error');
      return [];
    }
  }

  Future<Map<String,dynamic>> fetchAttachedFile(String token, String attatchmentToken) async {
    try {
      Map<String,dynamic> response = await _icsoService.fetchAttachedFile(token, attatchmentToken);
      return response;
    } catch (error) {
      _logger.e('Error fetching attached file: $error');
      rethrow;
    }
  }

}


